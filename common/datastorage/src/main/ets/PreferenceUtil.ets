import { common } from "@kit.AbilityKit";
import { preferences } from "@kit.ArkData";

const TAG = 'qwq - preference'

export class PreferenceUtil{

  private preference?:preferences.Preferences
  constructor() {}


  getPreference(context:common.UIAbilityContext){
    this.preference = preferences.getPreferencesSync(context,{name:'CookiesPreferences'})
    return this.preference
  }

  saveNumValue(key:string,value:number){
    this.preference?.putSync(key,value)
    this.preference?.flush((err)=>{
      if(err){
        console.info(TAG, 'Failed to flush. code =' + err.code + ',' + ' message =' + err.message);
        return
      }
      console.info(TAG,'Success to Flush')
    })
  }

  getNumValue(key:string){
    return this.preference?.getSync(key,0)
  }
}