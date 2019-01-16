/*      Luiza Torello Vieira e Victor Azadinho Miranda      ||      ED2

        Implemente o algoritmo de intercalação balanceada de vários caminhos. O programa deve ordenar 
    valores inteiros entre 0 e 999 presentes em um arquivo texto. Existem 6 fitas magnéticas disponí-
    veis que serão simuladas como um arquivo texto. O tamanho da área interna de ordenação deve ser
    de livre escolha do usuário.

        Os estados das fitas devem ser salvos em arquivos-texto, cada um representando uma das 6 fitas
    (além de um arquivo inicial com os dados desordenados). A cada intercalação, a ordenação deve ser
    temporariamente interrompida para que seja possível visualizar o estado dos arquivos das fitas. Ao
    final, deve estar disponível um arquivo texto com todos os valores ordenados.

    Entrega: 06/02/2019
*/
#include <stdio.h>
#include <stdlib.h>

void WriteInFile ( FILE *archieve, FILE *tape ) {
    int aux;
    for ( int i = 0; i < 3; i++ ) {
        if ( feof(archieve) == 0 ) {
            fscanf( archieve," %d ", &aux );
            fprintf(tape, " %d ", aux);
        } else
            break;
    }
}

void main () {
    char file[50];
    int memory;

    printf("\n\n\t\t***Ordenação por Intercalação Balanceada de vários Caminhos***");
    printf("\nMemória interna Disponível: ");
    scanf("%d",&memory);

    printf("\nArquivo a ser Ordenado: ");
    scanf("%s",file);

    FILE *archieve = fopen( file, "r");
    if ( archieve != NULL ) {
        
        FILE *tape01 = fopen("tape01.txt", "w");
        FILE *tape02 = fopen("tape02.txt", "w");
        FILE *tape03 = fopen("tape03.txt", "w");

        while ( feof(archieve) == 0 ) {
            WriteInFile( archieve, tape01 );
            WriteInFile( archieve, tape02 );
            WriteInFile( archieve, tape03 );
        }
        fclose(archieve);
    } else 
        printf("\nFalha na Abertura do Arquivo!");    
}