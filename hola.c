#include <stdio.h>
#include <stdlib.h>

// void pregunta_manifestacion(){
//     float hora_decimal;
//     int hora_entera;
//     printf("¿A que hora llegaste a la univeridad? ");
//     scanf("%d.%f", &hora_entera, &hora_decimal);
//     printf("Hora entera: %d , hora decimal: %f", hora_entera, hora_decimal);
//     if (hora_entera > 23 || hora_entera < 0 || hora_decimal > 59){
//         printf("Perdón, esa hora es incorrecta. Intente de nuevo\n");
//         pregunta_manifestacion();
//     }
//     return;
// }

void pregunta_manifestacion(){
    float hora_decimal;
    int hora_entera;
    printf("¿A que hora llegaste a la univeridad? ");
    scanf("%d.%f", &hora_entera, &hora_decimal);
    while(hora_entera > 23 || hora_entera < 0 || hora_decimal > 59){
        printf("Perdón, esa hora es incorrecta. Intente de nuevo\n");
        printf("¿A que hora llegaste a la univeridad? ");
        scanf("%d.%f", &hora_entera, &hora_decimal);
    }
    return;
}

int main(){
    pregunta_manifestacion();
    return 0;
}