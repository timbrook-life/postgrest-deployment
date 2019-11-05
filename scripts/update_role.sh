#!/bin/bash

vault write postgresql/roles/api creation_statements=@creation.sql
vault read postgresql/roles/api
