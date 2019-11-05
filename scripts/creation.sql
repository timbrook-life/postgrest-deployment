CREATE ROLE "{{name}}" NOINHERIT LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';
grant anonymous to "{{name}}";