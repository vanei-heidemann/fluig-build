# fluig-build
Utilitarios para criação dos ambientes de desenvolvimento fluig

## Targets
+ **make prepare-maven**<br>
Copia o settings.xml para a pasta ~/.m2, para que o maven funcione adequadamente.<br>
Deve ser rodado primeiro, caso ainda não tenha sido configurado o maven.

+ **make prepare-nextgen**<br>
Prepara um ambiente de desenvolvimento do fluig NextGen, projetos do Core.<br>
Por padrão, será criada a pasta fluig-nextgen um nivel acima da pasta corrente (ou seja, a pasta fluig-nextgen estará no mesmo nível da pasta corrente).<br>
Após preparado o ambiente, é recomendado que entre na pasta criada (**cd ../fluig-nextgen**), e termine a criação do ambiente, executando os seguintes comandos:<br>
    + **make gitclone-core**<br>
    + **make pom**<br>
    + **make build**<br>

+ **make prepare-core**<br>
Prepara um ambiente de desenvolvimento do fluig Core.<br>
Por padrão, será criada a pasta fluig-core um nivel acima da pasta corrente (ou seja, a pasta fluig-core estará no mesmo nível da pasta corrente).<br>
Após preparado o ambiente, é recomendado que entre na pasta criada (**cd ../fluig-core**), e termine a criação do ambiente, executando os seguintes comandos:<br>
    + **make gitclone**<br>
    + **make pom**<br>
    + **make mvn-clean-install**<br>

+ **make prepare-onpremise**<br>
Prepara um ambiente de desenvolvimento do fluig On Premise (Fluigão).<br>
Por padrão, será criada a pasta fluig-onpremise um nivel acima da pasta corrente (ou seja, a pasta fluig-onpremise estará no mesmo nível da pasta corrente).<br>
Após preparado o ambiente, é recomendado que entre na pasta criada (**cd ../fluig-onpremise**), e termine a criação do ambiente, executando os seguintes comandos:<br>
    + **make gitclone**<br>
    + **make pom**<br>
    + **make mvn-clean-install**<br>
