import fs from '@ohos.file.fs';
import { common } from "@kit.AbilityKit";
import {ConstUrl,ConstMap} from 'utils'
import { util } from '@kit.ArkTS';

const LoadTAG = 'qwq - LoadFromStorage'
const SaveTag = 'qwq - SaveToStorage'

export class DataStorage{

  private static instance:DataStorage
  public static getInstance(){
    if (!DataStorage.instance)
      DataStorage.instance = new DataStorage()
    return DataStorage.instance
  }

  public LoadFromStorage<T>(constKey:string,objArray:T[],context:common.UIAbilityContext){
    try {
      const filePath = `${context.filesDir}${ConstMap.get(constKey)}`

      if(!fs.accessSync(filePath)){
        // const file = fs.openSync(filePath,fs.OpenMode.CREATE)
        // fs.closeSync(file)
        console.info(LoadTAG,`${ConstMap.get(constKey)} dont exist.`)
        return
      }

      const file = fs.openSync(filePath,fs.OpenMode.READ_ONLY)

      const buffer = new ArrayBuffer(4096)
      const byteRead = fs.readSync(file.fd,buffer)
      fs.closeSync(file)

      if(byteRead === 0){
        objArray.length = 0
        console.info(LoadTAG,`File is empty.`)
        return
      }

      const uint8Array = new Uint8Array(buffer,0,byteRead)
      const Decoder = util.TextDecoder.create('utf-8',{ignoreBOM:true})
      const jsonStr = Decoder.decodeToString(uint8Array)
      const parseArray:T[] = JSON.parse(jsonStr)

      for(let i=0;i<parseArray.length;i++){
        objArray.push(parseArray[i])
      }

      console.info(LoadTAG,'Load is completed.')
    }catch (error){
      console.info(LoadTAG,'Failed to load.')
    }
  }

  public SaveToStorage<T>(constKey:string,objArray:T[],context:common.UIAbilityContext){
    try{
      const filePath = `${context.filesDir}${ConstMap.get(constKey)}`
      console.info(SaveTag,`Ready to save to ${filePath}`)

      const jsonStr = JSON.stringify(objArray)
      const encoder = util.TextEncoder.create('utf-8')
      const uint8Array = encoder.encodeInto(jsonStr)

      const file = fs.openSync(filePath,fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY |fs.OpenMode.TRUNC)

      const byteWritten = fs.writeSync(file.fd,uint8Array.buffer)
      fs.closeSync(file)

      console.info(LoadTAG,'Save is completed.')
    }catch (error){
      console.info(SaveTag,'Failed to load.')
    }
  }
}