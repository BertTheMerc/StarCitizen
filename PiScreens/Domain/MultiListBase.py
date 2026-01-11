class Base:
    def __init__(self):
        self.col_0 = ""
        self.col_1 = ""
        self.col_2 = ""
        self.col_3 = ""
        self.col_4 = ""

    def column(self, idx : int):
        if idx == 0:
            return self.col_0

        if idx == 1:
            return self.col_1

        if idx == 2:
            return self.col_2

        if idx == 3:
            return self.col_3
        
        if idx == 4:
            return self.col_4