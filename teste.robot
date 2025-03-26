*** Settings ***

Library            String
Library            azure_finder.py
Test Teardown      Atualizar teste no Test Plans    ${planId}    ${suiteId}    ${test_case}

*** Variables ***
${teste_validacao}    ok
${planId}     44264
${suiteId}    44490
##########################################################################
#                         Test Cases                                     #
##########################################################################
*** Test Cases ***
Teste 1
    Validação 1

Teste 2
    Validação 2

Teste 3
    Validação 3

Teste 4
    Validação 4

Teste 5
    Validação 5

Teste 6
    Validação 6
Teste 7
    Validação 7
Teste 8
    Validação 8
Teste 9
    Validação 9
Teste 10
    Validação 10

##########################################################################
#                         Keywords                                       #
##########################################################################
*** Keywords ***

Validação 1  
    ${test_case}  Set Variable    44415
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'nok'
        Log    TEST OK
    ELSE
        Fail
    END


Validação 2
    ${test_case}  Set Variable    44416
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'nok'
        Log    TEST OK
    ELSE
        Fail
    END

Validação 3
    ${test_case}  Set Variable    44417
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'ok'
        Log    TEST OK
    ELSE
        Fail
    END

Validação 4
    ${test_case}  Set Variable    44418
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'ok'
        Log    TEST OK
    ELSE
        Fail
    END

Validação 5
    ${test_case}  Set Variable    44419
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'banana'
        Log    TEST OK
    ELSE
        Fail
    END

Validação 6
    ${test_case}  Set Variable    44420
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'ok'
        Log    TEST OK
    ELSE
        Fail
    END

Validação 7
    ${test_case}  Set Variable    44421
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'nok'
        Log    TEST OK
    ELSE
        Fail
    END

Validação 8
    ${test_case}  Set Variable    44422
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'banana'
        Log    TEST OK
    ELSE
        Fail
    END

Validação 9
    ${test_case}  Set Variable    44423
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'banana'
        Log    TEST OK
    ELSE
        Fail
    END
Validação 10
    ${test_case}  Set Variable    44424
    Set Suite Variable     ${test_case}
    IF     $teste_validacao.lower() == 'ok'
        Log    TEST OK
    ELSE
        Fail
    END


##########################################################################
#                 Global: atualiza teste no Test Plans                   #
##########################################################################


Atualizar teste no Test Plans
    [Arguments]    ${planId}    ${suiteId}    ${test_case}
    Efetuar lista de testes    ${planId}    ${suiteId}
    Criar Json com base da lista de testes retornada
    ${test_id}    Efetuar GET do test_id referente o teste case      ${test_case}

    

Efetuar lista de testes
    [Arguments]    ${planId}    ${suiteId}
    ${cases}    list_tests    ${planId}    ${suiteId}
    #Log To Console   cases ${cases}
    Set Suite Variable    ${cases}


Criar Json com base da lista de testes retornada  
    ${cases_string}    Convert To String     ${cases}
    ${cases_string_formatado}   Replace String    ${cases_string}    '    "
    gerar json   json_recebido     ${cases_string_formatado}    ${EXECDIR}



Efetuar GET do test_id referente o teste case
    [Arguments]    ${test_case}
    ${test_id}    pegar valor de test id do json     ${test_case}
    Log To Console    test_id: ${test_id}
    Set Suite Variable     ${test_id}
    Set Suite Variable     ${test_case}
    Atualizando de fato o test plans

Atualizando de fato o test plans
    Log To Console    Resultado desse teste foi: ${TEST_STATUS}
    IF     $TEST_STATUS == 'FAIL'
        fail_test    ${planId}    ${suiteId}    ${test_id}
    ELSE
        pass_test    ${planId}    ${suiteId}    ${test_id}
    END