import pandas as pd
csv_file = pd.DataFrame(pd.read_csv("./file.csv", sep = "|", header = 0, index_col = False))

writer = pd.ExcelWriter('./file.xlsx', engine='xlsxwriter')

csv_file.to_excel(writer, sheet_name='Sheet1')
writer.save()

//http://xlsxwriter.readthedocs.io/pandas_examples.html

