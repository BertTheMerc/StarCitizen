import requests

from Domain import ShipComponent, ShipWeapon, RepairOutposts, LootResale, ShipDetails

class Repo:
    API_BASE = "http://localhost:5270/api"
    API_BASE_LIVE = "https://starcitizenendpoints-bpfpd7h3acczfzb9.ukwest-01.azurewebsites.net/api"
    def get_pledge_ships(self):
        json = self._get_all("vehicles")
        data = [ShipDetails.ShipDetails.from_json(item) for item in json]
        return data
    
    def get_vehicle_components(self):
        json = self._get_all("vehiclecomponents")
        data = [ShipComponent.ShipComponent.from_json(item) for item in json]
        return data

    def get_vehicle_weapons(self):
        json = self._get_all("vehicleweapons")
        data = [ShipWeapon.ShipWeapon.from_json(item) for item in json]
        return data

    def get_trade_routes(self):
        return self._get_all("traderoutes")

    def get_outposts(self):
        json = self._get_all("outposts")
        data = [RepairOutposts.RepairOutpost.from_json(item) for item in json]
        return data
    
    def get_loot_resale_prices(self):
        json = self._get_all("loot")
        data = [LootResale.LootResale.from_json(item) for item in json]
        return data

    def _get_all(self, source: str):
        url = f"{self.API_BASE_LIVE}/{source}"
        resp = requests.get(url, timeout=15)
        resp.raise_for_status()
        return resp.json()