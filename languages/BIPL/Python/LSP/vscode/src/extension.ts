import * as vscode from 'vscode';
import { LanguageClient, LanguageClientOptions, ServerOptions } from 'vscode-languageclient/node';

let client: LanguageClient | undefined;

export function activate(context: vscode.ExtensionContext) {
  const command = vscode.workspace.getConfiguration('bipl').get<string>('serverCommand', 'bipl-lsp');

  const serverOptions: ServerOptions = {
    command,
    args: []
  };

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: 'file', language: 'bipl' }],
    synchronize: {
      fileEvents: vscode.workspace.createFileSystemWatcher('**/*.bipl')
    }
  };

  client = new LanguageClient('bipl-lsp', 'BIPL Language Server', serverOptions, clientOptions);
  client.start();
  context.subscriptions.push(client);
}

export function deactivate(): Thenable<void> | undefined {
  return client?.stop();
}
