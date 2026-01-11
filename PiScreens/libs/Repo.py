from datetime import datetime, timedelta
from Domain import TradeRoute, ShipDetails, RepairOutposts, ShipComponent, LootResale
import mysql.connector

class Repo:
    def _get_connection():
        return  mysql.connector.connect(
                host="192.168.1.200",
                port=3306,
                user="PiStar",
                password="PiStar!")

    def get_pledge_ships():
        ships = []

        con = Repo._get_connection()
        cur = con.cursor()
        cur.execute("SELECT ship_name, claim, expedite, expedition FROM `pistar`.`ships` WHERE pledged=True;")
        
        for (ship_name, claim, expedite, expedition) in cur:
            c = datetime.strptime(claim,"%M:%S")
            e = datetime.strptime(expedite,"%M:%S")
            
            ships.append(ShipDetails.ShipDetails(ship_name, timedelta(minutes=c.minute, seconds=c.second), timedelta(minutes=e.minute, seconds=e.second), expedition))
        
        con.close()
        
        return ships

    def get_trade_route(pickup_point):
        routes = []

        con = Repo._get_connection()
        cur = con.cursor()

        sql = f"SELECT drop_off, goods, buy, sell, scu_sizes FROM `pistar`.`trade_route` WHERE pick_up='{pickup_point[0]}'"
        print (sql)
        cur.execute(sql)
        
        for (drop_off, goods, buy, sell, scu_sizes) in cur:
            routes.append(TradeRoute.TradeRoute(starting=pickup_point[0], target=drop_off, goods=goods, buy_cost=buy, sale_amount=sell, scu_sizes=scu_sizes))

        con.close()

        print (len(routes))

        return routes

    def get_trade_route_sources():
        pick_ups = []

        con = Repo._get_connection()
        cur = con.cursor()
        cur.execute("SELECT DISTINCT pick_up FROM `pistar`.`trade_route`;")

        for (pick_up) in cur:
            pick_ups.append(pick_up)

        con.close()

        return pick_ups

    def get_outposts(area):
        outposts = []

        con = Repo._get_connection()
        cur = con.cursor()

        sql = f"SELECT outpost, pad_sizes, repair, garage FROM `pistar`.`outposts` WHERE area='{area[0]}'"
        print (sql)
        cur.execute(sql)
        
        for (outpost, pad_sizes, repair, garage) in cur:
            outposts.append(RepairOutposts.RepairOutpost(name=outpost, area=area[0], pad_sizes=pad_sizes, repair=repair, garage=garage))

        con.close()

        print (len(outposts))

        return outposts

    def get_outpost_sources():
        outposts = []

        con = Repo._get_connection()
        cur = con.cursor()
        cur.execute("SELECT DISTINCT area FROM `pistar`.`outposts`;")

        for (area) in cur:
            outposts.append(area)

        con.close()

        return outposts

    def get_components(component_type: str, comp_class: str, grade: str, size: int):
        components = []

        con = Repo._get_connection()
        cur = con.cursor()

        where = ""
        if comp_class != "All":
            where += f" AND class='{comp_class}'"

        if grade !=  "All":
            where += f" AND grade='{grade}'"

        if (size != -1):
            where += f" AND size={size}"

        sql = f"SELECT component_name, manufacturer, class, grade, size FROM `pistar`.`components` WHERE component_type='{component_type[0]}' " + where
        
        print (sql)
        cur.execute(sql)
        
        for (component_name, manufacturer, cclass, grade, size) in cur:
            components.append(ShipComponent.ShipComponent(name=component_name, comp_type=component_type[0], man=manufacturer, c=cclass, grade=grade, size=size))

        con.close()

        if (len(components) > 0):
            components.sort(key=lambda x: x.name)

        if (len(components) == 0):
            components.append(ShipComponent.ShipComponent(name="No Components", man="", c="", grade="", size=0))
            
        return components

    
    def get_all_components():
        components = []

        con = Repo._get_connection()
        cur = con.cursor()

        sql = f"SELECT * FROM `pistar`.`components`"
        
        print (sql)
        cur.execute(sql)
        
        for (component_name, component_type, manufacturer, cclass, grade, size) in cur:
            components.append(ShipComponent.ShipComponent(name=component_name, comp_type=component_type, man=manufacturer, c=cclass, grade=grade, size=size))

        con.close()

        print (len(components))

        if (len(components) > 0):
            components.sort(key=lambda x: x.name)
            

        if (len(components) == 0):
            components.append(ShipComponent.ShipComponent(name="No Components", comp_type = "", man="", c="", grade="", size=0))
            
        return components

    def get_loot_components():
        def get_type(sc: ShipComponent):
            return sc.comp_type
        
        def get_class(sc: ShipComponent):
            return sc.cclass
        
        def get_size(sc: ShipComponent):
            return sc.size
        
        components = []

        con = Repo._get_connection()
        cur = con.cursor()
        
        sql = f"SELECT item_type, sub_item_type, component_name, manufacturer, comp_type, class, grade, size FROM `pistar`.`components` WHERE class IN ('Military', 'Stealth') AND Size IN (1,2) AND grade IN ('A', 'B')"
        
        print (sql)
        cur.execute(sql)
        
        for (component_name, component_type, cclass, grade, size) in cur:
            components.append(ShipComponent.ShipComponent(name=component_name, comp_type=component_type, man="", c=cclass, grade=grade, size=size))

        con.close()

        if (len(components) == 0):
            components.append(ShipComponent.ShipComponent(name="No Components",comp_type = "", man="", c="", grade="", size=0))
    
        return sorted(components, key=lambda x: (get_type(x), get_size(x), get_class(x) ))
    
    def get_components_sources():
        components = []

        con = Repo._get_connection()
        cur = con.cursor()
        cur.execute("SELECT DISTINCT component_type FROM `pistar`.`components`;")

        for (component_type) in cur:
            components.append(component_type)

        con.close()

        return components

    def get_loot_resale_prices():
        loot = []

        con = Repo._get_connection()
        cur = con.cursor()
        cur.execute("SELECT item_name, item_type, item_sub_type, size, cargo_sale FROM `pistar`.`loot_resale`;")

        for (name, item_type, sub_type, size, cargo_sale) in cur:
            loot.append(LootResale.LootResale(name=name, item_type=item_type, sub_item_type=sub_type, size=size,cargo_sale=cargo_sale))

        con.close()

        return sorted(loot, key=lambda x:x.amount_per_volume, reverse=True)

    def get_all_outposts():
        outposts = []

        con = Repo._get_connection()
        cur = con.cursor()

        sql = f"SELECT system_name, group_name, area, outpost, pad_sizes, repair, garage FROM `pistar`.`view_outposts`"
        cur.execute(sql)
        
        for (system_name, group_name, area, outpost, pad_sizes, repair, garage) in cur:
            outposts.append(RepairOutposts.RepairOutpost(system=system_name, group=group_name, area=area,name=outpost, pad_sizes=pad_sizes, repair=repair, garage=garage))

        con.close()

        return outposts



         
