"""System DAG to monitor all Airflow services."""

import logging
from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.dummy_operator import DummyOperator


with DAG(
    dag_id="monitor",
    catchup=False,
    max_active_runs=1,
    schedule_interval=timedelta(days=1),
    default_args={
        'start_date': datetime(2020, 1, 1)
    }
) as dag:

    start_task = DummyOperator(task_id="start")
    end_task = DummyOperator(task_id="end")

    monitor_task = PythonOperator(
        task_id="monitor",
        python_callable=lambda: logging.info("Monitor Task")
    )

    start_task >> monitor_task >> end_task
