const buscador=document.getElementById('buscar');
const tarjetas=[...document.querySelectorAll('.card')];
const botones=[...document.querySelectorAll('[data-filter]')];
let categoria='todos';
const normalizar=s=>s.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'');
function filtrar(){
  const busqueda=normalizar(buscador.value.trim());let cantidad=0;
  for(const tarjeta of tarjetas){
    tarjeta.hidden=!((categoria==='todos'||tarjeta.dataset.category===categoria)&&normalizar(tarjeta.textContent).includes(busqueda));
    if(!tarjeta.hidden)cantidad++;
  }
  document.getElementById('resultado').textContent=cantidad+' '+(cantidad===1?'documento disponible':'documentos disponibles');
  document.getElementById('sin-resultados').hidden=cantidad>0;
}
buscador.addEventListener('input',filtrar);
for(const boton of botones)boton.addEventListener('click',()=>{
  categoria=boton.dataset.filter;
  for(const otro of botones){otro.classList.toggle('active',otro===boton);otro.setAttribute('aria-pressed',String(otro===boton));}
  filtrar();
});
