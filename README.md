# JSON to XML Oracle

The Oracle package that convert JSON to XML base on [mbleron/JSONUtilities](https://github.com/mbleron/JSONUtilities)

## Usage

```sql
select json_to_xml.convert('{"id": 1, "name": "Micheal Scott"}') from dual;
-- Output
-- <id>1</id>
-- <name>Micheal Scott</name>
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)