create or replace package json_to_xml is

  function convert (input in clob) return xmltype;

end json_to_xml;
/