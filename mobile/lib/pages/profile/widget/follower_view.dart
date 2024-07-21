import 'package:flutter/material.dart';

class FollowerPage extends StatefulWidget {
  const FollowerPage({super.key});

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBar(),
          const SizedBox(
            height: 20,
          ),
          const Text('Người thân (3)'),
          const Divider(),
          // Use the custom ListTile widgets here
          FollowerListTile(
            name: 'Phạm Gia Nguyên',
            description: '123456789',
            imageUrl: 'https://via.placeholder.com/150',
            onTap: () {
              // Handle tap
            },
          ),
          FollowerListTile(
            name: 'Nguyễn Văn Khuê',
            description: '123456789',
            imageUrl: 'https://via.placeholder.com/150',
            onTap: () {
              // Handle tap
            },
          ),

          FollowerListTile(
            name: 'Phúc Nguyên',
            description: '123456789',
            imageUrl: 'https://via.placeholder.com/150',
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          Text('Chuyên gia y tế (1)'),
          const Divider(),
          FollowerListTile(
              name: 'Trần Văn Tình',
              description: "123456789",
              imageUrl: 'https://via.placeholder.com/150',
              onTap: () {})
        ],
      ),
    );
  }
}

class FollowerListTile extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  const FollowerListTile({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: Text(description),
      trailing: Icon(
        Icons.clear,
        color: Theme.of(context).colorScheme.error,
      ),
      onTap: onTap,
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  void _onTextChanged(String text) {
    setState(() {
      _hasText = text.isNotEmpty;
    });
  }

  void _clearText() {
    _controller.clear();
    _onTextChanged('');
    FocusScope.of(context).unfocus(); // Dismiss the keyboard
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onTextChanged,
      decoration: InputDecoration(
        hintText: 'Thêm người theo dõi',
        prefixIcon: IconButton(
          icon: Icon(_hasText ? Icons.arrow_back : Icons.add_circle_outline),
          onPressed: () {
            if (_hasText) {
              _clearText();
            }
          },
        ),
        suffixIcon: _hasText
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: _clearText,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context)
            .colorScheme
            .surfaceContainerHigh, // Background color of the search bar
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );
  }
}
