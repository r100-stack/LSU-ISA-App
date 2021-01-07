import 'package:flutter/material.dart';
import 'package:isa_app/blocs/auth_bloc.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/screens/event_details/widgets/action_button.dart';
import 'package:provider/provider.dart';

// TODO: This may need to be deprecated. Commented out references to old AuthBloc
class UserModifyDetailsScreen extends StatelessWidget {
  static final String routeName = '/user_modify_details';

  @override
  Widget build(BuildContext context) {
    // String name =
    //     Provider.of<AuthBloc>(context, listen: false).currentUser.name;
    // TextEditingController controller = TextEditingController(text: name);

    return Scaffold(
      appBar: AppBar(
        title: Text('User details'),
      ),
      body: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 2),
          child: Column(
            children: [
              TextFormField(
                // controller: controller,
                decoration: InputDecoration(
                  hintText: 'Display name',
                  icon: Icon(Icons.alternate_email),
                ),
              ),
              const SizedBox(height: kDefaultMargin),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
                color: Theme.of(context).accentColor,
                child: Text('Save'),
                onPressed: () {
                  // Provider.of<AuthBloc>(context, listen: false)
                  //     .modifyUserName(controller.text);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Display name saved'),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
