class Sql_query:
    def __init__(self, cur):
        self.cur = cur
        pass

    def insert(self, table_name, attributes, values):
        
        #For SQL QUERY
        sql = "INSERT INTO " + str(table_name) + '('
        for i, att in enumerate(attributes):
            if i!=(len(attributes)-1):
                sql += att + ', '
            else:
                sql += att + ')' + ' VALUES(' + str('%s, '*len(values))[:-2] + ')'
        # print(sql, values)
        self.cur.execute(sql, values)

        pass

    # def insert(self, table_name, attributes, values):
        
    #     #For SQL QUERY
    #     sql = "INSERT INTO " + str(table_name) + '('
    #     val = ''
    #     for i, att in enumerate(attributes):
    #         if i!=(len(attributes)-1):
    #             sql += att + ', '
    #             val += str(values[i]) + ', '
    #         else:
    #             sql += att + ')' + ' VALUES(' + val + str(values[-1]) + ')'
    #     print(sql)
    #     self.cur.execute(sql, values)

    #     pass

    def update(self, table_name, attributes, values):
        sql = "UPDATE " + str(table_name) + ' SET '
        i = 0
        while i < len(attributes)-2:
            sql += attributes[i+1] + ' = ' + "'" + str(values[i+1]) +"'" + ', '
            i += 1
        sql += attributes[-1] + ' = ' + "'" + str(values[-1]) +"'" + ' WHERE '+ attributes[0] + ' = ' + str(values[0])
        # print(sql)
        self.cur.execute(sql)
        
        pass

    def delete(self, table_name, attributes, values):

        sql = "DELETE FROM " + str(table_name) + ' '
        sql += ' WHERE '+ attributes[0] + ' = ' + str(values)
        # print(sql)
        self.cur.execute(sql)
        pass
       
