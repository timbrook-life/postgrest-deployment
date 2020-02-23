CREATE ROLE "{{name}}" NOINHERIT LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';

GRANT doadmin TO "{{name}}";

