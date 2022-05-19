import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc_state/bloc/contact_bloc.dart';
import 'package:tp_bloc_state/ui/widgets/button.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Column(
        children: [
          BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
            return ButtonBarch ();
          }),
          Center(
            child: Text("Contacts"),
          ),
          Expanded(child: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state.requested == Requested.Loading) {
                return CircularProgressIndicator();
              } else if (state.requested == Requested.Loaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.contacts.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                        leading: CircleAvatar(
                            child: Text("${state.contacts[index].profile}"
                                .substring(0, 1))),
                        title: Text("${state.contacts[index].name}"),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<ContactBloc>().add(DeleteContactEvent(index));
                          },
                        ));
                  }),
                );
              } else if (state.requested == Requested.Error) {
                return Column(
                  children: [
                    Text("${state.errorMessage}"),
                    ElevatedButton(
                        onPressed: () => {
                              context
                                  .read<ContactBloc>()
                                  .add(context.read<ContactBloc>().lastEvent)
                            },
                        child: Text("reload"))
                  ],
                );
              } else {
                return Center(
                  child: Text("Nothing"),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
