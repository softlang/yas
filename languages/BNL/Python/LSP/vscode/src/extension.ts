import * as vscode from 'vscode';
import {LanguageClient, LanguageClientOptions, ServerOptions} from 'vscode-languageclient/node';

let client: LanguageClient | undefined;

export function activate(context: vscode.ExtensionContext) {
    const command = vscode.workspace.getConfiguration('bnl').get<string>('serverCommand', 'bnl-lsp');

    const serverOptions: ServerOptions = {
        command,
        args: []
    };

    const clientOptions: LanguageClientOptions = {
        documentSelector: [{scheme: 'file', language: 'bnl'}],
        synchronize: {
            fileEvents: vscode.workspace.createFileSystemWatcher('**/*.bnl')
        }
    };

    client = new LanguageClient('bnl-lsp', 'BNL Language Server', serverOptions, clientOptions);
    client.start();
    context.subscriptions.push(client);
}

export function deactivate(): Thenable<void> | undefined {
    return client?.stop();
}
