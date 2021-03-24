## Apache Airflow Local Env

Airflow Dockerfile: `docker/airflow.Dockerfile`

Make commands for Airflow (call from `etl` folder):
- `make airflow-run` - build and run local copy of the airflow container
- `make airflow-clean` - stop and remove the airflow container
- `make airflow-bash` - build, run a local copy of the airflow container and attach bash CLI to it
- `make airflow-webserver-logs` - get web server logs of the airflow container
- `make airflow-scheduler-logs` - get scheduler logs of the the airflow container
- `make airflow-worker-logs` - get worker logs of the the airflow container
