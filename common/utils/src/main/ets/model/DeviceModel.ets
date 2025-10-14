export class DeviceModel{
  name:string = 'null'
  icon:string = ''
  psc:number = 0
  description:string = ''

  constructor(name?: string, icon?: string, psc?:number, description?: string) {
    if (name) this.name = name;
    if (icon) this.icon = icon;
    if (psc) this.psc = psc;
    if (description) this.description = description;
  }
}

