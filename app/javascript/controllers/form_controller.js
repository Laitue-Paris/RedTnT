import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="form"
export default class extends Controller {
  connect(){
  }
  submit(event) {
    event.preventDefault();
    console.log(event)
    fetch(event.target.action, {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: new FormData(event.target)
    })
    .then(response => response.json())
    .then((data) =>{
      if (data.success) {
        Swal.fire({
          icon: "success",
          title: "Vous avez loué le bon t-shirt rouge !"
        })
        .then(result=>{
          if (result.isConfirmed) {
            window.location.href = data.url
          }
        })
      }
      else {
        Swal.fire({
          icon: "error",
          title: "Oups Red alert !"
        })
        event.target.outerHTML = data.form;
      }
    })

  }
}
