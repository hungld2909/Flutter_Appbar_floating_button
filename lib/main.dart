import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppbarExample();
  
  }
}
// adapted from officall flutter gallery
class BottomAppbarExample extends StatefulWidget {
 const BottomAppbarExample({Key key}) : super(key: key);

  @override
  _BottomAppbarExampleState createState() => _BottomAppbarExampleState();
}

class _BottomAppbarExampleState extends State<BottomAppbarExample> {

FloatingActionButtonLocation _fablocation = FloatingActionButtonLocation.endDocked;
bool _isBottomBarNotched = false;
bool _isFabMini = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: Text(" Float ting ActionButton position: "),
            trailing: DropdownButton<FloatingActionButtonLocation>(
              value: this._fablocation,
              onChanged: (FloatingActionButtonLocation newVal){
                if(newVal != null){
                  setState(() =>
                    this._fablocation = newVal);
                }
              },
              items: [
                DropdownMenuItem(
                  child: Text("center Float"),
                  value: FloatingActionButtonLocation.centerDocked,
                  ),
                DropdownMenuItem(
                  child: Text("Docket"),
                  value: FloatingActionButtonLocation.endFloat,
                  ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerDocked,
                  child: Text("Center Docked")
                ),
                DropdownMenuItem(
                  child: Text("end Docked"),
                  value: FloatingActionButtonLocation.endDocked,
                  ),
                DropdownMenuItem(
                  child: Text("Mini Start Top"),
                  value: FloatingActionButtonLocation.miniStartTop,
                  ),
                DropdownMenuItem(
                  child: Text("Start Top"),
                  value: FloatingActionButtonLocation.startTop, 
                  )
              ],
            ),
          ),
          ListTile(
            title: Text("Mini FAB: "),
            trailing: Switch(
              value: this._isFabMini, 
              onChanged: (bool val){
                setState(() => this._isFabMini = val);
              }
              ),
          ),
          ListTile(
            title: Text("BotTomAppBar notch: "),
            trailing: Switch(
              value: this._isBottomBarNotched, 
              onChanged: (bool val) {
                setState(() => this._isBottomBarNotched = val);
              }
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        mini: this._isFabMini,
        onPressed: () => Fluttertoast.showToast(
          msg: "Dumy floating action button"),
         ),
         floatingActionButtonLocation: this._fablocation,
         bottomNavigationBar: this._buildBottomAppBar(context),
    );
  }
  BottomAppBar _buildBottomAppBar(BuildContext context){
    return BottomAppBar(
      shape: this._isBottomBarNotched ? CircularNotchedRectangle() : null,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          //bottom that pops up from the bottom of the screen
          IconButton(
            icon: Icon(Icons.menu), 
            onPressed: ()=> showModalBottomSheet(
              context: context, 
              builder: (BuildContext context) =>Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Dumy Bottom Sheet"),
              )
              )
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: ()=>Fluttertoast.showToast(msg: 'Dumy seach action'),

           
            ),
            IconButton(
              icon: Icon(Icons.more_vert), 
              onPressed: ()=>Fluttertoast.showToast(msg: 'Dumy menu action'),
              )
        ],
      ),
    );
  }
}