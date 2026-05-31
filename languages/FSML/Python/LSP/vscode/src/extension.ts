import * as vscode from 'vscode';
import { LanguageClient, LanguageClientOptions, ServerOptions } from 'vscode-languageclient/node';

let client: LanguageClient | undefined;

export function activate(context: vscode.ExtensionContext) {
  const serverOptions: ServerOptions = {
    command: 'fsml-lsp',
    args: []
  };

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: 'file', language: 'fsml' }],
    synchronize: {
      fileEvents: vscode.workspace.createFileSystemWatcher('**/*.fsml')
    }
  };

  client = new LanguageClient('fsml-lsp', 'FSML Language Server', serverOptions, clientOptions);
  client.start();
  context.subscriptions.push(client);
}

export function deactivate(): Thenable<void> | undefined {
  if (!client) {
    return undefined;
  }
  return client.stop();
}
