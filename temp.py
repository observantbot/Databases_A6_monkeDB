import yaml

l = open('db.yaml')
print(l)

db = yaml.safe_load(open('db.yaml'))
print(db)
