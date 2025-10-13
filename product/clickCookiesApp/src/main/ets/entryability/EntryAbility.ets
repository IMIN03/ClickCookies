import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { MemoryData } from 'workshop';
import { DataStorage,PreferenceUtil} from 'datastorage';
import { ConstStr} from 'utils';


const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    this.saveGameData()
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      this.loadGameData()
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    this.saveGameData()
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    this.loadGameData()
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    this.saveGameData()
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }

  private loadGameData(): void {
    try {
      const memoryData = MemoryData.getInstance();
      const store = new PreferenceUtil().getPreference(this.context)

      const savedCookies = store.getSync(ConstStr.TOTAL_COOKIES, 0) as number;
      memoryData.totalCookies = savedCookies;

      hilog.info(DOMAIN, 'GameData', 'Game data loaded successfully');
    } catch (error) {
      hilog.error(DOMAIN, 'GameData', 'Failed to load game data: %{public}s', JSON.stringify(error));
    }
  }

  private saveGameData(): void {
    try {
      const memoryData = MemoryData.getInstance();
      const dataStorage = DataStorage.getInstance()
      const store = new PreferenceUtil().getPreference(this.context)

      store.putSync(ConstStr.TOTAL_COOKIES,memoryData.totalCookies)
      store.flush();

      hilog.info(DOMAIN, 'GameData', 'Game data saved successfully');
    } catch (error) {
      hilog.error(DOMAIN, 'GameData', 'Failed to save game data: %{public}s', JSON.stringify(error));
    }
  }
}