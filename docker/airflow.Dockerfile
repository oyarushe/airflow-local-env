ARG AIRFLOW_BASE_IMAGE="apache/airflow:2.1.2-python3.6"
FROM ${AIRFLOW_BASE_IMAGE}

COPY --chown=airflow:airflow ./etl/requirements.txt ${AIRFLOW_HOME}
RUN pip install --user -r ${AIRFLOW_HOME}/requirements.txt

COPY --chown=airflow:airflow ./etl/dags /opt/airflow/dags
COPY --chown=airflow:airflow ./etl/plugins /opt/airflow/plugins
COPY --chown=airflow:airflow ./etl/tests /opt/airflow/tests
COPY --chown=airflow:airflow ./etl/variables.json /opt/airflow/variables.json

COPY --chown=airflow:airflow ./docker/airflow_files/entrypoint.sh /entrypoint
COPY --chown=airflow:airflow ./docker/airflow_files/entrypoint.d /entrypoint.d

ENV AIRFLOW__WEBSERVER__RBAC=True
ENV AIRFLOW__WEBSERVER__EXPOSE_CONFIG=True
ENV AIRFLOW__CORE__DAG_RUN_CONF_OVERRIDES_PARAMS=True
