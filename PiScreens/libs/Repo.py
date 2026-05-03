import requests

from Domain import ShipComponent, ShipWeapon

class Repo:
    API_BASE = "http://localhost:5270/api"
    API_BASE_LIVE = "https://starcitizenendpoints-bpfpd7h3acczfzb9.ukwest-01.azurewebsites.net/api"
    def get_pledge_ships(self):
        return self._get_all("ships")
    
    def get_vehicle_components(self):
        json = self._get_all("vehiclecomponents")
        comps = [ShipComponent.ShipComponent.from_json(item) for item in json]
        return comps

    def get_vehicle_weapons(self):
        json = self._get_all("vehicleweapons")
        comps = [ShipWeapon.ShipWeapon.from_json(item) for item in json]
        return comps

    def get_trade_routes(self):
        return self._get_all("traderoutes")

    def get_outposts(self):
        return self._get_all("outposts")
    
    def get_loot_resale_prices(self):
        return self._get_all("loot")

    def _get_all(self, source: str):
        url = f"{self.API_BASE_LIVE}/{source}"
        resp = requests.get(url, timeout=15)
        resp.raise_for_status()
        return resp.json()