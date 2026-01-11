import pytest
from unittest.mock import Mock

from Domain.Fleet import Fleet

@pytest.fixture
def ship_a():
    ship = Mock()
    ship.name = "Alpha"
    return ship


@pytest.fixture
def ship_b():
    ship = Mock()
    ship.name = "Beta"
    return ship


@pytest.fixture
def fleet():
    return Fleet()

def test_add_ship_increases_count(fleet, ship_a):
    fleet.add(ship_a)
    assert fleet.count == 1

def test_get_ship_by_name(fleet, ship_a, ship_b):
    fleet.add(ship_a)
    fleet.add(ship_b)

    assert fleet.get_ship("Alpha") == ship_a
    assert fleet.get_ship("Beta") == ship_b

def test_get_ship_by_index(fleet, ship_a, ship_b):
    fleet.add(ship_a)
    fleet.add(ship_b)

    assert fleet.get_ship(0) == ship_a
    assert fleet.get_ship(1) == ship_b

def test_get_ship_not_found(fleet, ship_a):
    fleet.add(ship_a)

    assert fleet.get_ship("Unknown") is None
    assert fleet.get_ship(99) is None

def test_get_ship_invalid_key_type(fleet):
    with pytest.raises(TypeError):
        fleet.get_ship(3.14)

def test_timer_created_on_add(fleet, ship_a):
    fleet.add(ship_a)
    timer = fleet.get_timer("Alpha")
    assert timer is not None

def test_get_timer_matches_ship(fleet, ship_a, ship_b):
    fleet.add(ship_a)
    fleet.add(ship_b)

    timer_a = fleet.get_timer("Alpha")
    timer_b = fleet.get_timer("Beta")

    assert timer_a is not timer_b


