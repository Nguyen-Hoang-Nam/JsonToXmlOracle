# JSON to XML Oracle

The Oracle package that convert JSON to XML base on [mbleron/JSONUtilities](https://github.com/mbleron/JSONUtilities)

## Usage

```sql
select json_to_xml.convert('{
  "_id": "658a4fc342a7c9338144f941",
  "index": 0,
  "guid": "0f8bdb6f-3d40-4c20-9ada-c0ac2244932c",
  "isActive": false,
  "balance": "$3,782.96",
  "picture": "http://placehold.it/32x32",
  "age": 22,
  "eyeColor": "green",
  "name": "Lelia Velasquez",
  "gender": "female",
  "company": "CALCULA",
  "email": "leliavelasquez@calcula.com",
  "phone": "+1 (857) 401-3803",
  "address": "528 Stryker Court, Seymour, Virginia, 1566",
  "about": "Pariatur est culpa sint nostrud velit reprehenderit elit est elit enim excepteur. Qui veniam do aliqua commodo consectetur sint labore quis culpa adipisicing ut nisi dolor. Consequat qui sint laboris mollit laboris. Officia cillum adipisicing ullamco tempor elit eu quis laboris voluptate. Qui occaecat sunt et ex nisi voluptate veniam sit irure et magna dolor. Officia est culpa pariatur veniam ad est anim consequat deserunt dolor do. Mollit tempor laboris sunt dolore aute nostrud ex magna ex velit.\r\n",
  "registered": "2021-06-15T07:19:26 -07:00",
  "latitude": 4.733644,
  "longitude": 77.349653,
  "tags": [
    "veniam",
    "excepteur",
    "consectetur",
    "esse",
    "id",
    "veniam",
    "dolor"
  ],
  "friends": [
    {
      "id": 0,
      "name": "Sonja Whitehead"
    },
    {
      "id": 1,
      "name": "Linda Cruz"
    },
    {
      "id": 2,
      "name": "Shepherd Leblanc"
    }
  ],
  "greeting": "Hello, Lelia Velasquez! You have 1 unread messages.",
  "favoriteFruit": "strawberry"
}') from dual;
```

Output

```xml
<_id>658a4fc342a7c9338144f941</_id>
<index>0</index>
<guid>0f8bdb6f-3d40-4c20-9ada-c0ac2244932c</guid>
<isActive>false</isActive>
<balance>$3,782.96</balance>
<picture>http://placehold.it/32x32</picture>
<age>22</age>
<eyeColor>green</eyeColor>
<name>Lelia Velasquez</name>
<gender>female</gender>
<company>CALCULA</company>
<email>leliavelasquez@calcula.com</email>
<phone>+1 (857) 401-3803</phone>
<address>528 Stryker Court, Seymour, Virginia, 1566</address>
<about>Pariatur est culpa sint nostrud velit reprehenderit elit est elit enim excepteur. Qui veniam do aliqua commodo consectetur sint labore quis culpa adipisicing ut nisi dolor. Consequat qui sint laboris mollit laboris. Officia cillum adipisicing ullamco tempor elit eu quis laboris voluptate. Qui occaecat sunt et ex nisi voluptate veniam sit irure et magna dolor. Officia est culpa pariatur veniam ad est anim consequat deserunt dolor do. Mollit tempor laboris sunt dolore aute nostrud ex magna ex velit.
</about>
<registered>2021-06-15T07:19:26 -07:00</registered>
<latitude>4.733644</latitude>
<longitude>77.349653</longitude>
<tags>veniam</tags>
<tags>excepteur</tags>
<tags>consectetur</tags>
<tags>esse</tags>
<tags>id</tags>
<tags>veniam</tags>
<tags>dolor</tags>
<friends>
  <id>0</id>
  <name>Sonja Whitehead</name>
</friends>
<friends>
  <id>1</id>
  <name>Linda Cruz</name>
</friends>
<friends>
  <id>2</id>
  <name>Shepherd Leblanc</name>
</friends>
<greeting>Hello, Lelia Velasquez! You have 1 unread messages.</greeting>
<favoriteFruit>strawberry</favoriteFruit>
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)