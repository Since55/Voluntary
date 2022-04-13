import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voluntary/models/contacts.dart';

class ContactsPanel extends StatelessWidget {
  final Contacts contacts;

  const ContactsPanel(this.contacts, {Key? key}) : super(key: key);

  Widget _buildTelegram() {
    return ContactButton(
      icon: const Icon(Icons.telegram),
      onTap: () {
        String _url;
        const String _baseUrl = 'https://t.me/';
        final _tg = contacts.telegram!;

        if (_tg.startsWith(_baseUrl)) {
          _url = _tg;
        } else if (_tg.startsWith('@')) {
          _url = _baseUrl + _tg.substring(1);
        } else {
          _url = _baseUrl + _tg;
        }

        launch(_url);
      },
    );
  }

  Widget _buildPhone() {
    return ContactButton(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.phone),
          const SizedBox(width: 8),
          Text(contacts.phone!),
        ],
      ),
    );
  }

  Widget _buildEmail() {
    return ContactButton(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.email_outlined),
          const SizedBox(width: 8),
          Text(contacts.email!),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(

      children: [
        if (contacts.email != null) _buildEmail(),
        if (contacts.phone != null) _buildPhone(),
        if (contacts.telegram != null) _buildTelegram(),
      ],
    );
  }
}

class ContactButton extends StatelessWidget {
  final Widget icon;
  final void Function()? onTap;

  const ContactButton({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: icon,
        ),
      ),
    );
  }
}
