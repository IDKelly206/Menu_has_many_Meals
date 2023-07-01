import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="meal-new"
export default class extends Controller {
  static targets = [ "getMenuID", "getUserID", "getType", "setMenuID", "setUserID", "setType"]
  connect() {
    console.log("Meal New controller")


    console.log(this.getMenuIDTarget.querySelectorAll("input[type='checkbox']").forEach(element => element.checked ? console.log(element.value) : 0 ))
    // console.log(this.getMenuIDTarget.querySelectorAll("input[type='checkbox']").forEach(element => console.log(element.value)))

    console.log(this.getUserIDTarget.querySelectorAll("input[type='checkbox'][checked='checked']").forEach(element => console.log(element.value)))
    console.log(this.getTypeTarget.firstElementChild.value)
    console.log(this.setTypeTarget.value)

  }

  setMeal(event) {
    event.preventDefault()
    this.setMenuIDTarget.value = this.menuIDs;
    this.setUserIDTarget.value = this.userIDs;
    this.setTypeTarget.value = this.mealType;
  }

  get menuIDs() {
    let menuIDs = []
    this.getMenuIDTarget.querySelectorAll("input[type='checkbox']").forEach(element => element.checked ? menuIDs.push(element.value) : 0 )
    return menuIDs
  }

  get userIDs() {
    let userIDS = []
    this.getUserIDTarget.querySelectorAll("input[type='checkbox']").forEach(element => element.checked ? userIDS.push(element.value) : 0 )
    return userIDS
  }

  get mealType() {
    let mealType = this.getTypeTarget.firstElementChild.value
    return mealType
  }



}
