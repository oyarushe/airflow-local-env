"""System DAG to monitor all Airflow services."""

import logging
from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.python_operator import PythonOperator


with DAG(
    dag_id="monitor",
    catchup=False,
    max_active_runs=1,
    schedule_interval=timedelta(days=1),
    default_args={
        'start_date': datetime(2020, 1, 1)
    }
) as dag:

    PythonOperator(
        task_id="monitor",
        python_callable=lambda: logging.info("Monitor Task")
    )
