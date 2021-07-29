#!/usr/bin/env bash

airflow users create \
  -r Admin \
  -u ${AIRFLOW_ADMIN_USERNAME:-admin} \
  -p ${AIRFLOW_ADMIN_PASSWORD:-admin} \
  -e ${AIRFLOW_ADMIN_EMAIL:-admin@airflow.com} \
  -f ${AIRFLOW_ADMIN_FIRST_NAME:-Admin} \
  -l ${AIRFLOW_ADMIN_LAST_NAME:-Admin}
