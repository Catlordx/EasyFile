import 'package:flutter/material.dart';
import 'package:xfm/src/rust/api/window_manager.dart';
import 'package:xfm/src/rust/frb_generated.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize RustLib
  await RustLib.init();
  toCenter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Explorer',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const FileExplorerHome(),
    );
  }
}

class FileExplorerHome extends StatefulWidget {
  const FileExplorerHome({super.key});

  @override
  State<FileExplorerHome> createState() => _FileExplorerHomeState();
}

class _FileExplorerHomeState extends State<FileExplorerHome> {
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: 200,
            color: Theme.of(context).colorScheme.surface,
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.desktop_windows),
                  title: const Text('Desktop'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text('Documents'),
                  onTap: () {},
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Devices', style: TextStyle(color: Colors.grey)),
                ),
                ListTile(
                  leading: const Icon(Icons.computer),
                  title: const Text('Local Disk (C:)'),
                  onTap: () {},
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Toolbar
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: Icon(_isGridView ? Icons.grid_view : Icons.list),
                        onPressed: () {
                          setState(() {
                            _isGridView = !_isGridView;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // File View
                Expanded(
                  child: _isGridView
                      ? GridView.builder(
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: 20, // Example count
                          itemBuilder: (context, index) {
                            return _buildFileItem();
                          },
                        )
                      : ListView.builder(
                          itemCount: 20, // Example count
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.insert_drive_file),
                              title: Text('File $index'),
                              subtitle: const Text('Modified: 2024-03-21'),
                              onTap: () {},
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.insert_drive_file, size: 48),
        const SizedBox(height: 8),
        const Text(
          'File Name',
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
