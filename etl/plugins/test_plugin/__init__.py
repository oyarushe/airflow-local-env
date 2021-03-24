"""Test Plugin."""

from airflow.plugins_manager import AirflowPlugin


class TestPlugin(AirflowPlugin):
    """Test Plugin."""

    name = "test_plugin"
    operators = []
    hooks = []
    sensors = []
    operator_extra_links = []
