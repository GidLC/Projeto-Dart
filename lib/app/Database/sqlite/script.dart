final criarBanco = ''' 
CREATE TABLE produtos(
  id INTEGER NOT NULL PRIMARY KEY
  ,produto VARCHAR(200) NOT NULL
  ,marca VARCHAR (50) NOT NULL
  ,valor DOUBLE(18,2) NOT NULL
)
''';

final inserir = '''
INSERT INTO produtos(produto,marca,valor)
VALUES('celular','LG','1500')
''';

final inserir2 = '''
INSERT INTO produtos(produto,marca,valor)
VALUES('notebook','Acer','2600')
''';

final inserir3 = '''
INSERT INTO produtos(produto,marca,valor)
VALUES('tablet','Positivo','650')
''';
