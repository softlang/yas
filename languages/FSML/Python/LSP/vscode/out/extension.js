"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = activate;
exports.deactivate = deactivate;
const vscode = require("vscode");
const node_1 = require("vscode-languageclient/node");
let client;
function activate(context) {
    const serverOptions = {
        command: 'fsml-lsp',
        args: []
    };
    const clientOptions = {
        documentSelector: [{ scheme: 'file', language: 'fsml' }],
        synchronize: {
            fileEvents: vscode.workspace.createFileSystemWatcher('**/*.fsml')
        }
    };
    client = new node_1.LanguageClient('fsml-lsp', 'FSML Language Server', serverOptions, clientOptions);
    client.start();
    context.subscriptions.push(client);
}
function deactivate() {
    if (!client) {
        return undefined;
    }
    return client.stop();
}
//# sourceMappingURL=extension.js.map