document.addEventListener("DOMContentLoaded", ()=>{
    const carruselItems = document.querySelector(".carrusel_items")
    const items = document.querySelectorAll(".item")
    const prevButton = document.querySelector(".boton_anterior")
    const nextButton = document.querySelector(".boton_siguente");
    const itemsLength = items.length
    // Como iniciamos en los bombones lo puse en 6 para que tome como indice eso
    let i = 6
    console.log(i)
  
    prevButton.addEventListener("click", ()=>{
        const desplazamiento = i *( 100/itemsLength)
        if(i > 0){
            i--;
        }else  {
            // Esto te envia a la imagen 12
            i = itemsLength - 13
        } 
        carruselItems.style.transform = `translateX( -${desplazamiento}%)`;
    })
    
    nextButton.addEventListener("click", ()=>{
        const desplazamiento = -i *( 100/itemsLength)
        if(i < itemsLength - 6){
            i++;
            console.log(i)
            console.log(desplazamiento)
        }else  {
            // Esto te envia a la imagen 7
            i = 7
        }
        carruselItems.style.transform = `translateX( ${desplazamiento}%)`;
    })
  })