import 'package:flutter/material.dart';
import 'package:flutter_demo/Pages/components/SingleChildScrollView_demo.dart';
import 'package:flutter_demo/Pages/components/alert_dialog_demo.dart';
import 'package:flutter_demo/Pages/components/button_demo.dart';
import 'package:flutter_demo/Pages/components/card_demo.dart';
import 'package:flutter_demo/Pages/components/checkbox_demo.dart';
import 'package:flutter_demo/Pages/components/chip_demo.dart';
import 'package:flutter_demo/Pages/components/data_table_demo.dart';
import 'package:flutter_demo/Pages/components/datetime_demo.dart';
import 'package:flutter_demo/Pages/components/dropdownButton_demo.dart';
import 'package:flutter_demo/Pages/components/expansion_panel_demo.dart';
import 'package:flutter_demo/Pages/components/floating_action_button_demo.dart';
import 'package:flutter_demo/Pages/components/form_demo.dart';
import 'package:flutter_demo/Pages/components/gestureDetector_demo.dart';
import 'package:flutter_demo/Pages/components/indexedStack_demo.dart';
import 'package:flutter_demo/Pages/components/paginated_data_table_demo.dart';
import 'package:flutter_demo/Pages/components/popup_menu_button_demo.dart';
import 'package:flutter_demo/Pages/components/radio_demo.dart';
import 'package:flutter_demo/Pages/components/richText_demo.dart';
import 'package:flutter_demo/Pages/components/simple_dialog_demo.dart';
import 'package:flutter_demo/Pages/components/slider_demo.dart';
import 'package:flutter_demo/Pages/components/snack_bar_demo.dart';
import 'package:flutter_demo/Pages/components/stepper_demo.dart';
import 'package:flutter_demo/Pages/components/bottom_sheet_demo.dart';
import 'package:flutter_demo/Pages/components/switch_demo.dart';
import 'package:flutter_demo/Pages/components/AspectRatio_demo.dart';
import 'package:flutter_demo/Pages/components/stack_demo.dart';
import 'package:flutter_demo/Pages/components/container_demo.dart';
import 'package:flutter_demo/Pages/components/constrainedBox_demo.dart';
import 'package:flutter_demo/Pages/components/textRich_demo.dart';

class ComponentsPage extends StatefulWidget {
  ComponentsPage({Key key}) : super(key: key);
  @override
  _ComponentsPageState createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组件页面'),
        elevation: 0.0, //阴影大小
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'DropdownButton', page: DropdownButtonDemo()),
          ListItem(title: 'Text.rich', page: TextRichDemo()),
          ListItem(title: 'RichText', page: RichTextDemo()),
          ListItem(title: 'IndexedStack', page: IndexedStackDemo()),
          ListItem(title: 'GestureDetector', page: GestureDetectorDemo()),
          ListItem(
              title: 'SingleChildScrollView',
              page: SingleChildScrollViewDemo()),
          ListItem(title: 'ConstrainedBox', page: ConstrainedBoxDemo()),
          ListItem(title: 'Container', page: ContainerDemo()),
          ListItem(title: 'Stack', page: StackDemo()),
          ListItem(title: 'AspectRatio', page: AspectRatioDemo()),
          ListItem(title: 'Stepper', page: StepperDemo()),
          ListItem(title: 'Card', page: CardDemo()),
          ListItem(title: 'PaginatedDataTable', page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTable', page: DataTableDemo()),
          ListItem(title: 'Chip', page: ChipDemo()),
          ListItem(title: 'ExpansionPanel', page: ExpansionPanelDemo()),
          ListItem(title: 'SnackBar', page: SnackBarDemo()),
          ListItem(title: 'BottomSheet', page: BottomSheetDemo()),
          ListItem(title: 'AlertDialog', page: AlertDialogDemo()),
          ListItem(title: 'SimpleDialog', page: SimpleDialogDemo()),
          ListItem(title: 'Date & Time', page: DateTimeDemo()),
          ListItem(title: 'Slider', page: SliderDemo()),
          ListItem(title: 'Switch', page: SwitchDemo()),
          ListItem(title: 'Radio', page: RadioDemo()),
          ListItem(title: 'Checkbox', page: CheckboxDemo()),
          ListItem(title: 'Form', page: FormDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(
              title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('_WidgetDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              ),
            ],
          ),
        ));
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]),
        ),
      ),
      child: ListTile(
        title: Text(title),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[400],
          size: 18,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
