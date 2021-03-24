# Airflow

AIRFLOW_BUCKET={your_bucket_mwaa}

.PHONY: airflow-run
airflow-run:
	docker-compose build airflow-webserver
	docker-compose up --detach airflow-webserver airflow-scheduler airflow-worker airflow-celery-flower

.PHONY: airflow-clean
airflow-clean:
	docker-compose down

.PHONY: airflow-bash
airflow-bash:
	docker-compose up --detach airflow-bash
	docker-compose exec airflow-bash bash

.PHONY: airflow-webserver-logs
airflow-webserver-logs:
	docker-compose logs -f airflow-webserver

.PHONY: airflow-scheduler-logs
airflow-scheduler-logs:
	docker-compose logs -f airflow-scheduler

.PHONY: airflow-worker-logs
airflow-worker-logs:
	docker-compose logs -f airflow-worker

.PHONY: airflow-build
airflow-build:
	docker-compose build airflow-webserver

.PHONY: airflow-deploy-dags
airflow-deploy-dags:
	aws s3 cp dags s3://${AIRFLOW_BUCKET}/dags --recursive --exclude="*pycache*" --exclude="*.pyc"

.PHONY: airflow-deploy-requirements
airflow-deploy-requirements:
	aws s3 cp requirements-mwaa.txt s3://${AIRFLOW_BUCKET}/requirements.txt

.PHONY: airflow-deploy-plugins
airflow-deploy-plugins:
	rm plugins.zip || true
	cd plugins; zip -r ../plugins.zip . -x *pycache*; cd -
	aws s3 cp plugins.zip s3://${AIRFLOW_BUCKET}/plugins.zip
