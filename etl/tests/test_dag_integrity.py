from airflow.models import DagBag


def test_dag_integrity():
    """
    Test DAG integrity. Checks if DAGs are loaded without errors
    """

    dag_bag = DagBag()
    assert 0 == len(dag_bag.import_errors), f"DAG import failures. Errors: {dag_bag.import_errors}"
