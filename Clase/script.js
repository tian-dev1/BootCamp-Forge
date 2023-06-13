// let texto = document.getElementById("nombre");
// alert(`Hola ${texto.value}`);


async function cargarDatosPokemon(){
    const response = await fetch("https://pokeapi.co/api/v2/pokemon/ditto");
    console.log("Esta es response"+ response);
    console.log(response);
    const jsonData = await response.json();
    console.log("Esta es jsonData"+ jsonData);
    console.log(jsonData);

}

function obtenerHabilidades(habilidades){

}