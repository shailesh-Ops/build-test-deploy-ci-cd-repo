# tests/test_app.py

import sys
import os
import json
import pytest

# Fix the path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'server-app')))

# Test the import first
try:
    from app import app
    print("✅ app imported successfully")
except Exception as e:
    print(f"❌ Import failed: {e}")
    raise


@pytest.fixture                   # ← fixture = reusable setup for all tests
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client              # gives client to every test below


# ---- Test 1 ----
def test_home_status_code(client):    # ← client comes from fixture above
    response = client.get("/health")
    assert response.status_code == 200


# ---- Test 2 ----
def test_home_message(client):
    response = client.get("/health")
    data = json.loads(response.data)
    assert " message " in data


# ---- Test 3 ----
def test_source_value(client):
    response = client.get("/health")
    data = json.loads(response.data)
    assert "DevOps-Engineer" in data[" message "]