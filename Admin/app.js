const BaseURL = "http://localhost:3004" || "https://awaitero.com:3004"; //"http://localhost:3004/api"
const BaseURLSuperUser = BaseURL + "/api/superAdmin";
const BaseURLAdmin = BaseURL + "/api/admin";
const BaseURLUser = BaseURL + "/api/user";
const domain = "http://localhost:3004" || "https://awaitero.com";
const BaseURLWithoutPort = "http://localhost:3004/api" || "https://awaitero.com";

const lodash = ``;
const copyRight = `Copyright &copy; Awaitero 2021`;
//SuperAdmin

const RestaurantMapping = {
  restaurantNumber: "Restaurant Number",
  contactPersonNumber: "Contact Person",
  mobile: "Contact Number",
  email: "Email",
  businessType: "Business Type",
};

function convertDate(inputFormat) {
  function pad(s) {
    return s < 10 ? "0" + s : s;
  }
  var d = new Date(inputFormat);
  return [pad(d.getMonth() + 1), pad(d.getDate()), d.getFullYear()].join("/");
}

function convertPayload(formID) {
  var arr = $("#" + formID).serializeArray();
  return arr.reduce(
    (r, c) =>
      Object.assign(r, {
        [c.name]: c.value,
      }),
    {}
  );
}

async function Axios(BaseURL, URL, method, data = null) {
  let tokenStr = JSON.parse(sessionStorage.getItem("token"))
  result = await new Promise((resolve, reject) => {
    axios({
      method: method,
      url: `${BaseURL}${URL}`,
      data: data,
      headers: {"Authorization" : `Bearer ${tokenStr}`},
      timeout: 20000
    })
      .then(function (data) {
        resolve(data);
      })
      .catch((err) => reject(err));
  });
  let res = result.data;
  if (res.status == 401) {
    sessionStorage.clear();
    window.location = domain+"/401/index.html"
  }else{
    return result
  }
}

function getUrlVars() {
  var vars = [],
    hash;
  var hashes = window.location.href
    .slice(window.location.href.indexOf("?") + 1)
    .split("&");
  for (var i = 0; i < hashes.length; i++) {
    hash = hashes[i].split("=");
    vars.push(hash[0]);
    vars[hash[0]] = hash[1];
  }
  return vars;
}

$(document).ready(function () {
  $("#copyRight").append(copyRight);
  if(sessionStorage.getItem("token") === '' || sessionStorage.getItem("token") === null  && ![domain,`${domain}/Admin/`,`${domain}/Admin/index.html`,`${domain}/Admin/restaurant.html`,`${domain}/Admin/dealer.html`,`${domain}/Admin/bill.html`].includes(window.location.href)){
    
    // window.location = domain+"/Admin/index.html";
    // window.location = domain+"/401/index.html"
    // alert("Unauthorized Access. Please login in again")
  }
});

function unauthorized(result){

  if (res.status == 401) {   
    window.location = domain+"/401/index.html"

    // alert("Unauthorized Access. Please login in again")

  // window.location = domain+"/Admin/index.html";
  }
  return true;
}
// $( window ).load(function() {
//     var isLogin = sessionStorage.getItem('isLogin');
//     sessionStorage.setItem('Flag',0);
//     if(isLogin!="1" && getUrlVars().ignore != 1)
//             window.location = 'main.html?ignore=1'
//   });

let ItemModel = (
  idx,
  { idItem, name, description, photoURL, price },
  options
) => `<div class="modal fade" id="myitemsModal${idx}" data-backdrop="static" 
data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content vin-item-detail-pop">
<div class="modal-header border-0">
<h5 class="modal-title" id="exampleModalLabel">Update Item</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body px-3 py-0">
<div class="pb-3 position-relative">
<!--<div class="position-absolute heart-fav">
 <a href="javascript:void(0)"><i class="mdi mdi-heart"></i></a> 
</div>-->
<img src="${photoURL.length === 0 ? '' : photoURL}" class="img-fluid col-md-6 p-0 rounded" alt="">
</div>
<h4 class="mb-2">${name}</h4>
<p>${description}</p>
<div class="mb-3">
    <div class="alert alert-success fade" id="ModelItemUpdateAlert${idx}" role="alert">
        
    </div>
</div>
<form id="updateItem${idx}">
<div class="d-flex align-items-center mb-4">
<div class="w-100">
    <input type="text" autocomplete="off" name="idItem" id="idItem" value="${idItem}" class="form-control form-control-sm p-0 border-input border-0 rounded-0" hidden>

<p class="mb-0 small font-weight-bold text-dark">Enter Item Name</p>
<input type="text" autocomplete="off" name="name" id="name" value=${name} class="form-control form-control-sm p-0 border-input border-0 rounded-0" placeholder="Enter Item Name">
 <label for="name" class="mb-0 small font-weight-bold error" style="color:red"></label>
 
 <p class="mb-0 small font-weight-bold text-dark">Select Category</p>
 <select class="form-control form-control-sm p-0 border-input border-0 rounded-0" id="categoryDropdown"aria-label="Default select example">
    <option  disabled="disabled" selected>Select Category</option>
    ${options}
  </select>
 
 <p class="mb-0 small font-weight-bold text-dark" style="margin-top: 10px;">Enter Description</p>
 <input type="text" autocomplete="off" name="description" id="description" value="${description}" class="form-control form-control-sm p-0 border-input border-0 rounded-0" placeholder="Enter Description">
 <label for="description" class="mb-0 small font-weight-bold error" style="color:red"></label>

 <p class="mb-0 small font-weight-bold text-dark">Enter Photo URL</p>
 <input type="text" autocomplete="off" name="photoURL" id="photoURL" value="${photoURL}" class="form-control form-control-sm p-0 border-input border-0 rounded-0" placeholder="Enter Photo URL">

  <label for="price" class="mb-0 small font-weight-bold error" style="color:red"></label>

  <p class="mb-0 small font-weight-bold text-dark">Enter Price</p>
  <input type="number" autocomplete="off" name="price" id="price" value="${price}" class="form-control form-control-sm p-0 border-input border-0 rounded-0" placeholder="Enter Price">
 <!-- <span  class="mb-0 small font-weight-bold text-dark" style="color:red" class="error" id="erroremail"></span>
  -->
  <label for="price" class="mb-0 small font-weight-bold error" style="color:red"></label>
</div>
</div>


</div>

<div class="modal-footer justify-content-start">

<input type="submit" onclick="updateItem(${idx})" class="btn btn-primary btn-block mb-3" value="Update Item"></a>
</div>
</div>
</form>

</div>

</div>`;

let itemList = (
  { idItem, name, price, photoURL, isUnavailable },
  categoryName
) => `<div class="col col-auto"><a href="javascript:void(0)"  onclick="ToggleItemUpdate(${idItem})"
class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4">
<img src="${photoURL ? photoURL: '/Admin/img/dishplacer.png' }" class="img-fluid rounded" alt="" style="width:200px;height:200px;${photoURL ? 'opacity: 1;' : 'opacity: 0.5;'}">
<div style="position: absolute;
top: -85px;
left: 16px;">

<span class="badge badge-warning ml-auto" >${categoryName}</span>


</div>
<div class="row mb-0" style="margin-right:0.5px">
<span class="badge ml-auto">Item Status:${
  isUnavailable == 0 ? "<span class='badge-success'>&nbsp;&nbsp;Available</span>" : "<span class='badge-light mr-1'>&nbsp;&nbsp;Unavailable</span>"
}
</span>
</div>
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">${name}</p>
<span class="badge badge-light ml-auto">Rs ${price}</span>
</div>



</a></div>`;

let schemaOfCoupon = {
  rules: {
    couponCode: {
      required: true,
      minlength: 5,
    },
    termsAndCondition: {
      maxlength: 1000,
    },
    description: {
      maxlength: 150,
    },
    validFrom: {
      required: true,
    },
    validTo: {
      required: true,
    },
    isActive: {
      required: true,
    },
  },
  messages: {
    couponCode: "Enter Coupon Code min length 5 ",
    validFrom: "Enter Valid From",
    validTo: "Enter Valid To",
    isActive: "Select the Coupon Status",
  },
};

let schemaOfItem = {
  rules: {
    name: {
      required: true,
      minlength: 4,
    },
    idCategory: {
      required: true,
    },
    description: {
      maxlength: 255,
    },
    photoURL: {
      required: false,
    },
    price: {
      required: true,
    },
  },
  messages: {
    name: "Enter Item Name ",
    idCategory: "Select Category",
    price: "Enter price",
  },
};
let getCategoryOption = (arr, selectedItem = null) => {
  return arr
    .map((val) => {
      if (selectedItem == val.idCategory && selectedItem != null)
        return `<option value="${val.idCategory}" selected>${val.name}</option>`;
      else return `<option value="${val.idCategory}">${val.name}</option>`;
    })
    .join("\n");
};
// let TableListModel = ({name,occupied,idTable,isActive,newlyOrdered},idResturant)=> `<tr>
// <td>${name}</td>
// <td><a class="btn btn-${occupied==0 ? 'warning' : 'success'} btn-sm" >${occupied==0 ? 'Vacant' : 'Occupied'}</a></td>
// <td><a class="btn btn-${isActive==0 ? 'success' : 'danger'} btn-sm" onclick="enableOrDisabletable(${idTable},${isActive})">${isActive==0 ? 'Enable' : 'Disable'}</a></td>
// <td><a class="btn btn-warning btn-sm" onclick="getTableDetails(${idTable})" >Get Details</a></td>
// <td>
// ${newlyOrdered==true ? `<a href="tableDetails.html?idRestaurant=${idResturant}&idTable=${idTable}" class="btn btn-success btn-sm">Ordered Recieved</a>` : ""}</td></tr>`
//
//     let TableListModel = ({name,occupied,idTable,isActive,newlyOrdered,idReference},idResturant,idx)=> `<div class="col-lg-2">
//     <div class="card" style="background-color: ${newlyOrdered==true ? 'lightblue': 'white'}">
//     <div class="card-body" style="color: black">
//       <h5 class="card-title">${name}</h5>
//       <p class="card-text" ></p>
//       <a class="btn btn-${occupied==0 ? 'warning' : 'success'} btn-sm mt-1" >Status: ${occupied==0 ? 'Vacant' : 'Occupied'}</a>
//       <a class="btn btn-${isActive==0 ? 'success' : 'danger'} btn-sm mt-1" onclick="enableOrDisabletable(${idTable},${isActive})">${isActive==0 ? 'Enable' : 'Disable'}</a>
//       <a class="btn btn-warning btn-sm mt-1" href="tableDetails.html?idRestaurant=${idResturant}&idTable=${idTable}" >Get Details</a>
//       ${occupied==0 ? `<a class="btn btn-warning btn-sm mt-1" onclick="OrderManual('${name}',${idTable},${idResturant})" >Order</a>`:''}

//       ${newlyOrdered==true ? `<a class="btn btn-success btn-sm mt-1" href="tableDetails.html?idRestaurant=${idResturant}&idTable=${idTable}">View Ordered</a>` : ""}

//     </div>
//   </div></div></div>`
let TableListModel = (
  {
    name,
    occupied,
    idTable,
    items,
    isActive,
    newlyOrderedCount,
    newlyOrdered,
    idReference,
  },
  idResturant,
  idx
) => {
  let notconfirmed = items.filter((val) => val.isConfirmed == 0);
  let color = "";
  if (notconfirmed.length) color = "#f6c23e";
  else if (occupied == 1) color = "#C0EC83";
  else color = "#f8f9fc";
  return `<div class="m-1 mb-0" style="width:100px;height:60px">
        <div class="card" style="overflow: hidden;
        white-space: nowrap;color:white;background-color:${color}">
        <a href="tableDetails.html?idRestaurant=${idResturant}&idTable=${idTable}">
        <div class="card-body text-center" style="color: black">
        <b>${name}</b>
        
        </div></a>
      </div></div>`;
};
/* <h6><span style="color: black;float:right">${notconfirmed.length > 0 ? notconfirmed.length: ''} </span></h6> */

//   <button type="button" onclick="downloadBase64File('${name}','${idReference}')" class="btn btn-success btn-sm mt-2">Download QR Code</a>

function getParameterByName(name, url = window.location.href) {
  name = name.replace(/[\[\]]/g, "\\$&");
  var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
    results = regex.exec(url);
  if (!results) return null;
  if (!results[2]) return "";
  return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function Logout() {
  localStorage.clear();
  sessionStorage.clear();
  window.location = "index.html";
}
let couponCodeCardView = ({
  idCoupon,
  idRestaurant,
  couponCode,
  termsAndCondition,
  description,
  validFrom,
  validTo,
  isActive,
  createdOn,
}) => `<div class="card-body">
<p><b>Coupon Code: ${couponCode}</b></p>
<p><b>Description: ${description}</b></p>
<p><b>Valid from: <span style="color:red">${validFrom}</span></b></p>
<p><b>Valid to: <span style="color:red">${validTo}</span></b></p>
<p><b>Terms And Condition: <span>${termsAndCondition}</span></b></p>
<p><b style="color:${isActive == 1 ? "green" : "red"}">Status: ${
  isActive == 1 ? "ACTIVE" : "INACTIVE"
}</b></p>
<p><b>Created On: ${createdOn} </b></p> 
<a href="javascript:void(0)" onclick="ToggleCouponUpdate(${idCoupon})"><b>Edit</b></a>
<a href="javascript:void(0)" style="margin-left:10px" onclick="couponDelete(${idCoupon})"><b>Delete</b></a><hr>
<hr>
</div>`;
let States = {
  1: "Andhra Pradesh",
  2: "Arunachal Pradesh",
  3: "Assam",
  4: "Bihar",
  5: "Chhattisgarh",
  6: "Goa",
  7: "Gujarat",
  8: "Haryana",
  9: "Himachal Pradesh",
  10: "Jammu and Kashmir",
  11: "Jharkhand",
  12: "Karnataka",
  13: "Kerala",
  14: "Madhya Pradesh",
  15: "Maharashtra",
  16: "Manipur",
  17: "Meghalaya",
  18: "Mizoram",
  19: "Nagaland",
  20: "Odisha",
  21: "Punjab",
  22: "Rajasthan",
  23: "Sikkim",
  24: "Tamil Nadu",
  25: "Telangana",
  26: "Tripura",
  27: "Uttarakhand",
  28: "Uttar Pradesh",
  29: "West Bengal",
  30: "Andaman and Nicobar Islands",
  31: "Chandigarh",
  32: "Dadra and Nagar Haveli",
  33: "Daman and Diu",
  34: "Delhi",
  35: "Lakshadweep",
  36: "Puducherry",
};

let dealerListModel = ({
  idDealer,
  isActive,
  firstName,
  lastName,
  mobile,
  alternateNumber,
  idState,
  email,
  city,
  address,
  createdOn,
  aadharIdProofPath,
  pancardIdProofPath,
}) => ` <div class="col-md-6 col-lg-4">
<div class="bg-white shadow-sm p-3 rounded mb-4">

<div class="d-flex align-items-center mb-3">
    
    <p class="badge badge-${
      isActive == 1 ? "success" : "warning"
    }" mb-0 ml-auto">Status:   ${isActive == 1 ? "ACTIVE" : "INACTIVE"}</p>
    </div>
    <div class="ml-auto">
        <button type="button" onclick=activateDealer(${idDealer},${
  isActive == 1 ? 0 : 1
}) class="btn btn-primary text-white" style="float:right">${
  isActive == 1 ? "INACTIVE" : "ACTIVE"
}</a>
        </div>
    <p class="font-weight-bold text-black mb-0">First Name: ${firstName}</p>
   
    <p class="font-weight-bold text-black mb-0">Last Name: ${lastName}</p>

    
   
<p class="font-weight-bold text-black mb-0">Mobile: ${mobile}</p>
<p class="font-weight-bold text-black mb-0">Email: ${email}</p>

<p class="font-weight-bold text-black mb-0">Alternate Number: ${alternateNumber} </p>
<p class="font-weight-bold text-black mb-0">State: ${States[idState]} </p>

<p class="font-weight-bold text-black mb-0">City: ${city} </p>
<p class="font-weight-bold text-black mb-0">Address: ${address} </p>
<p class="font-weight-bold text-black mb-0">Aadhar Id Proof : <a href="${BaseURL}/${aadharIdProofPath}" target="_blank">Link</a> </p>
<p class="font-weight-bold text-black mb-0">Pancard Proof : <a href="${BaseURL}/${pancardIdProofPath}" target="_blank">Link</a> </p>
<p class="font-weight-bold text-black mb-0">Registered On: ${createdOn} </p>


</div>

</div>`;

let categoryModel = ({ idCategory, name, type }) => {
  let tt = `'${name.trim()}'`;
  let vegnonveg = `<img src="img/${type == 1 ? "ic_veg.svg" : "ic_non.svg"}" alt="">`;

  return `<div class="row mt-1">
<a class="nav-link active border-0 btn btn-light" href="javascript:void();" role="tab" aria-controls="popular" aria-selected="true">${name} ${
    tt == "'All'" ? "" : vegnonveg
  } <i style="margin-left:5px;color:red"></i></a>
<div class="ml-auto">
    <a onclick="deleteCategory(${idCategory},${tt})" class="btn btn-primary text-white" style="float:right">DELETE</a>
    </div>
</div>`;
};

// $("*", "#formid").prop('disabled',true);
