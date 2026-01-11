from typing import List, Optional

class TradeRoute:
    def __init__(self, starting: str, target: str, goods: str, buy_cost: int, sale_amount: int, scu_sizes: str ):
        self.id = 0
        self.starting = starting
        self.target = target
        self.goods = goods
        self.buy_cost = buy_cost
        self.sale_amount = sale_amount
        self.scu_sizes = scu_sizes