import 'package:file_picker/file_picker.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainController extends GetxController{
FilePickerResult? result;


pickFile ()async{
 result = await FilePicker.platform.pickFiles(allowMultiple: true);
 if(result!=null){
  print(result.toString())
; }else{
  print("No File Picked");
}
}


}