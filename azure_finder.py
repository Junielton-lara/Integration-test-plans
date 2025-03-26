import requests as http
import json
import requests
import os


def __init__(self, token: str, releaseId: int) -> None:
        self.base_url = 'https://dev.azure.com/projetoorigemfinal/Boticário/'
        self.token = token
        self.releaseId = releaseId
        self.comment = ''
        self.tests = []
        self.update_comment()

def get_comment(self):
        return self.comment

def has_tests(self):
        return len(self.tests) > 0

def list_tests(planId,suiteId):
        response = http.get(
            f'https://dev.azure.com/projetoorigemfinal/Boticário//_apis/test/Plans/{planId}/Suites/{suiteId}/points',
            auth=('','xxx')
        )                
        body = json.loads(response.text)
        cases = []
        for case in body['value']:
            cases.append(
                {
                    'id': case['testCase']['id'],
                    'point': case['id'],
                    'suite': 44267
                }
            )        
        return cases

def pass_test(planId,suiteId,test_id):
        # if self.token == None: pass
        body = {'outcome': 2}
        r = requests.patch(f'https://dev.azure.com/projetoorigemfinal/Boticário//_apis/test/Plans/{planId}/Suites/{suiteId}/points/{test_id}?api-version=6.0', 
        auth=('', 'xxx'), json=body)

def fail_test(planId,suiteId,test_id):
        # if self.token == None: pass
        body = {'outcome': 3}
        r = requests.patch(f'https://dev.azure.com/projetoorigemfinal/Boticário//_apis/test/Plans/{planId}/Suites/{suiteId}/points/{test_id}?api-version=6.0', 
        auth=('', 'xxx'), json=body)


def gerar_json (nomearquivo,valor,destination):
    arquivo = open(nomearquivo+'.json', "w")
    arquivo.write(valor+'\n'+'\n')
    arquivo.close()
    files = os.path.abspath(os.getcwd())


def pegar_valor_de_test_id_do_json (test_case):
    with open("json_recebido.json", encoding='utf-8') as meu_json:
        dados = json.load(meu_json)    
    for i in dados:
        if i.get("id") == test_case:
            return  (i.get("point"))