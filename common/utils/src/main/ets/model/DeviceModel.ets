export class DeviceModel{
  name:string = 'null'
  icon:string = ''
  psc:number = 0
  description:string = ''
  price:number = 1

  constructor(name?: string, icon?: string, psc?:number, description?: string,price?:number) {
    if (name) this.name = name;
    if (icon) this.icon = icon;
    if (psc) this.psc = psc;
    if (description) this.description = description;
    if(price) this.price = price
  }
}

