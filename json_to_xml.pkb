create or replace package body json_to_xml is
    type json_item is record (
        content      json_element_t, 
        key          varchar2(4000),
        ordinal      pls_integer,
        parent_item  json_element_t
    );

    function get_child_xml (
        doc   in dbms_xmldom.DOMDocument,
        item  in json_item,
        docnode  in dbms_xmldom.DOMNode
    )
    return dbms_xmldom.DOMNode
    is
        node_name   varchar2(4000);
        node_value  varchar2(32767);
        node_text   dbms_xmldom.DOMText;
        node        dbms_xmldom.DOMNode;
        child_node  dbms_xmldom.DOMNode;
        element     dbms_xmldom.DOMElement;
        child_item  json_item;
        obj         json_object_t;
        arr         json_array_t;   
        keys        json_key_list;
    begin
        case
        when item.content.is_Object then
            if item.key is not null then
                element := dbms_xmldom.createElement(doc, item.key);
                node := dbms_xmldom.makeNode(element);
            else
                node := docnode;
            end if;

            obj := treat(item.content as json_object_t);
            keys := obj.get_keys();
            for i in 1 .. keys.count loop
                child_item.content := obj.get(keys(i));
                child_item.key := keys(i);
                child_item.parent_item := item.content;
                if child_item.content.is_Array then
                    child_node := get_child_xml(doc, child_item, node);
                else
                    child_node := dbms_xmldom.appendChild(node, get_child_xml(doc, child_item, node));
                end if;
            end loop;

        when item.content.is_Array then
            node := docnode;
            if item.key is not null then
                arr := treat(item.content as json_array_t);
                for i in 0 .. arr.get_size - 1 loop
                    child_item.content := arr.get(i);
                    child_item.key := item.key;
                    child_item.ordinal := i;
                    child_item.parent_item := item.content;
                    child_node := dbms_xmldom.appendChild(node, get_child_xml(doc, child_item, node));
                end loop;
            end if;

        when item.content.is_Scalar then
            case 
            when item.parent_item.is_object then
                obj := treat(item.parent_item as json_object_t);
                case 
                when item.content.is_string then
                node_value := obj.get_string(item.key);
                when item.content.is_number then
                node_value := to_char(obj.get_Number(item.key),'TM9','nls_numeric_characters=.,');
                when item.content.is_boolean then
                node_value := case when obj.get_boolean(item.key) then 'true' else 'false' end;
                end case;

            when item.parent_item.is_array then
                arr := treat(item.parent_item as json_array_t);
                case
                when item.content.is_string then
                node_value := arr.get_string(item.ordinal);
                when item.content.is_number then
                node_value := to_char(arr.get_Number(item.ordinal),'TM9','nls_numeric_characters=.,');
                when item.content.is_boolean then
                node_value := case when arr.get_boolean(item.ordinal) then 'true' else 'false' end;
                end case;
            end case;

            if item.key is not null then
                element := dbms_xmldom.createElement(doc, item.key);
                node := dbms_xmldom.makeNode(element);

                if not item.content.is_null then
                    node_text := dbms_xmldom.createTextNode(doc, node_value);
                    child_node := dbms_xmldom.appendChild(node, dbms_xmldom.makeNode(node_text));
                end if;
            end if;
        end case;

        return node;
    end;

    function convert (input in clob)
    return xmltype
    is
        doc     dbms_xmldom.DOMDocument;
        docnode dbms_xmldom.DOMNode;
        node    dbms_xmldom.DOMNode;
        item    json_item;
        output  xmltype;
    begin
        doc := dbms_xmldom.newDOMDocument();
        docnode := dbms_xmldom.makeNode(doc);
        item.content := json_element_t.parse(input);
        node := get_child_xml(doc, item, docnode);
        output := dbms_xmldom.getxmltype(doc);
        dbms_xmldom.freeDocument(doc);
        return output;
    end;
end json_to_xml;