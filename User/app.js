const BaseURL = "http://localhost:3004" || "https://awaitero.com:3004"; 
const BaseURLSuperUser = BaseURL + "/api/superAdmin";
const BaseURLUser = BaseURL + "/api/user";
const domain = "http://localhost:3004" ||  "https://awaitero.com";

function Axios(BaseURL, URL, method, data = {}) {
  return new Promise((resolve, reject) => {
    axios({
      method: method,
      url: `${BaseURL}${URL}`,
      data: data,
    })
      .then(function (data) {
        resolve(data);
      })
      .catch((err) => reject(err));
  });
}

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}
var getUrlParameter = function getUrlParameter(sParam) {
  var sPageURL = window.location.search.substring(1),
    sURLVariables = sPageURL.split("&"),
    sParameterName,
    i;

  for (i = 0; i < sURLVariables.length; i++) {
    sParameterName = sURLVariables[i].split("=");

    if (sParameterName[0] === sParam) {
      return typeof sParameterName[1] === undefined
        ? true
        : decodeURIComponent(sParameterName[1]);
    }
  }
  return false;
};

var CategoryModel = ({ idCategory, name }) =>
  `<div class="cat-item px-1 py-3"><p class="m-0 small" >${capitalizeFirstLetter(
    name
  )}</p></div>`;

var CategoryAndItemModel = (
  { name, items, type, idCategory },
  cartItem = [],
  str = null
) => {
  if (str && str.length) {
    var y = new RegExp(str, "gmi");
    items = items.filter((val) => val.name.match(y));
  }
  return items.length > 0
    ? `<div class="row" id="idCAT${idCategory}">
<h6 class="mb-4 mt-3 col-md-12"> ${capitalizeFirstLetter(name)}  <img src="${
        type == 0 ? "img/ic_non.svg" : "img/ic_veg.svg"
      }" style="width:15px;height:15px;margin-right:10px"><small class="text-black-50">${
        items.length
      } ITEMS</small></h6>
<div class="col-md-12 px-0 border-top">

    ${items
      .map((val, idx) => {
        if (cartItem.some((va) => val.idItem == va.idItem)) {
          count = cartItem.filter((v) => v.idItem == val.idItem);
          return `
          <div class="bg-white" id="items">
          <div class="p-3 border-bottom menu-list">
          <div id="btnAdd${idx}">
             <p class="text-gray mb-0 float-right ml-2 mt-1 text-muted" id="btnAmount${idx}"> Rs ${
            val.price * count.length
          }</p>
             <span class="count-number float-right"><button type="button" class="btn-sm left dec btn btn-outline-secondary"> <i class="feather-minus" onclick="deleteItemFromCart(${
               val.idItem
             })"></i> 
             </button>
             <input class="count-number-input" id="itemCount${idx}" type="text" readonly="" value="${
            count.length
          }">
             <button type="button" class="btn-sm right inc btn btn-outline-secondary"> <i class="feather-plus" onclick="addItemToCart(${
               val.idItem
             },${idx})"></i> </button></span>
          </div>
          <div class="media">
             <img src="${
               val.photoURL
             }" alt="" class="mr-3" style="width:90px;height:90px">
             <div class="media-body">
                <h6 class="mb-1 font-weight-bold">${val.name}</h6>
                <p class="text-muted mb-0" ml-3>${val.description} </p>
                <p class="text-muted mb-0" ml-3>&#8377;${val.price} </p>
             </div>
          </div>
       </div>
       </div>`;
        } else {
          return `
        <div class="bg-white" id="items">
        <div class="p-3 border-bottom menu-list">
        <span class="float-right">
        <button  onclick="addItemToCart(${val.idItem},${idx})" class="btn btn-outline-secondary btn-sm">ADD</button></span> 
        <div class="media">
           <img src="${val.photoURL}" alt="" class="mr-3" style="width:90px;height:90px">
           <div class="media-body">
              <h6 class="mb-1 font-weight-bold">${val.name}</h6>
              <p class="text-muted mb-0" ml-3>${val.description} </p>
              <p class="text-muted mb-0">&#8377;${val.price} </p>
           </div>
        </div>
     </div>`;
        }
      })
      .join("\n")}
</div>
</div>`
    : "";
};
// <span class="float-right">
// <button  onclick="addItemToCart(${val.idItem},${idx})" class="btn btn-outline-secondary btn-sm">ADD</button></span>

// <div class="p-3 border-bottom menu-list">
// <span class="count-number float-right"><button type="button" class="btn-sm left dec btn btn-outline-secondary"> <i class="feather-minus"></i> </button><input class="count-number-input" type="text" readonly="" value="1"><button type="button" class="btn-sm right inc btn btn-outline-secondary"> <i class="feather-plus"></i> </button></span>
// <div class="media">
// <img src="img/starter2.jpg" alt="" class="mr-3 rounded-pill ">
// <div class="media-body">
// <h6 class="mb-1">Cheese corn Roll <span class="badge badge-danger">BEST SELLER</span></h6>
// <p class="text-muted mb-0">$600</p>
// </div>
// </div>
// </div>
