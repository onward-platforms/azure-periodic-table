import React, { useState } from 'react';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import ReactMarkdown, { Components } from 'react-markdown';
import remarkGfm from 'remark-gfm';
import { Icons } from '@/components/ui/icons';
import { LoadingSpinner } from '@/components/ui/loading-spinner';
import { ReactMarkdownProps } from 'react-markdown/lib/complex-types';
import { CodeComponent, LiProps } from 'react-markdown/lib/ast-to-react';
import { AnchorHTMLAttributes } from 'react';
import { URLBox } from './ui/url-box';

type ChatBoxProps = {
  prompt: string;
};

export const ChatBox: React.FC<ChatBoxProps> = ({ prompt }) => {
  const [userInput, setUserInput] = useState<string>('');
  const [botResponse, setBotResponse] = useState<string>('');
  const [requestCount, setRequestCount] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  const [isStreaming, setIsStreaming] = useState(false);
  const [suggestionsVisible, setSuggestionsVisible] = useState(true);

  const MAX_REQUESTS = 5;

  const questionSuggestions = [
    'What are the key features of this service?',
    'What are some common CLI commands to work with this service?',
    'Can you show me how to deploy this with Terraform?',
    'What is the pricing model of this service?',
  ];

  const handleKeyPress = (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (event.key === 'Enter') {
      handleChatSubmit();
    }
  };

  const handleChatSubmit = async () => {
    if (userInput.trim() === '') return;
    if (requestCount >= MAX_REQUESTS) {
      alert('You have reached the maximum number of requests.');
      return;
    }

    setRequestCount(requestCount + 1);
    setIsLoading(true);
    setIsStreaming(false);
    setBotResponse('');
    setSuggestionsVisible(false); // Hide suggestions after submitting

    try {
      const response = await fetch('/api/generate', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          model: 'gpt-4o',
          messages: [
            {
              role: 'system',
              content: prompt,
            },
            {
              role: 'user',
              content: userInput,
            },
          ],
          temperature: 0.2,
          max_tokens: 1000,
          stream: true,
        }),
      });

      if (!response.ok || !response.body) {
        throw new Error(response.statusText);
      }

      const reader = response.body.getReader();
      const decoder = new TextDecoder('utf-8');
      let botMessageContent = '';

      let doneReading = false;
      setIsStreaming(true);
      while (!doneReading) {
        const { value, done } = await reader.read();
        if (done) break;

        const chunkValue = decoder.decode(value);

        const lines = chunkValue
          .split(/\r?\n/)
          .map((line) => line.trim())
          .filter((line) => line !== '');

        for (const line of lines) {
          if (line === 'data: [DONE]') {
            doneReading = true;
            break;
          }
          if (line.startsWith('data: ')) {
            const jsonStr = line.replace('data: ', '');
            try {
              const json = JSON.parse(jsonStr);
              const content = json.choices[0].delta?.content;
              if (content) {
                botMessageContent += content;
                setBotResponse(botMessageContent);
              }
            } catch (e) {
              console.error('Error parsing JSON:', e);
            }
          }
        }
      }
    } catch (error) {
      console.error('Error interacting with OpenAI API:', error);
    } finally {
      setIsLoading(false);
      setIsStreaming(false);
      setUserInput('');
    }
  };

  // Custom Code Block Component
  const CodeBlock: CodeComponent = ({
    node,
    inline,
    className,
    children,
    ...props
  }) => {
    const [isCopied, setIsCopied] = useState(false);

    const handleCopy = () => {
      navigator.clipboard.writeText(String(children)).then(() => {
        setIsCopied(true);
        setTimeout(() => setIsCopied(false), 2000);
      });
    };

    if (inline) {
      return (
        <code
          className="bg-neutral-50 dark:bg-neutral-900 px-1 rounded"
          {...props}
        >
          {children}
        </code>
      );
    }

    return (
      <div className="relative my-4 w-full">
        <pre className="overflow-x-auto rounded-lg bg-neutral-50 dark:bg-neutral-900 p-4 font-mono text-sm w-full max-w-full break-words">
          <code className={className} {...props}>
            {children}
          </code>
        </pre>
        <button
          onClick={handleCopy}
          className="absolute top-2 right-2 p-2 rounded bg-white dark:bg-black hover:bg-neutral-200 dark:hover:bg-neutral-700"
        >
          {isCopied ? (
            <Icons.Check className="w-4 h-4" />
          ) : (
            <Icons.Copy className="w-4 h-4" />
          )}
        </button>
      </div>
    );
  };

  // Custom Link Component
  const CustomLink: React.FC<
    AnchorHTMLAttributes<HTMLAnchorElement> & ReactMarkdownProps
  > = ({ href, children, ...props }) => (
    <URLBox href={href || '#'} text={String(children)} />
  );

  // Custom List Item Component
  const CustomListItem: React.FC<LiProps> = ({ children, ...props }) => (
    <li className="list-disc list-outside ml-5" {...props}>
      <span>{children}</span>
    </li>
  );

  // Components Object
  const components: Components = {
    ul: ({ children, ...props }) => (
      <ul className="list-disc list-inside ml-5" {...props}>
        {children}
      </ul>
    ),
    ol: ({ children, ...props }) => (
      <ol className="list-decimal list-inside ml-5" {...props}>
        {children}
      </ol>
    ),
    li: CustomListItem,
    a: CustomLink,
    code: CodeBlock,
  };

  return (
    <div className="flex flex-col my-4 space-y-4 w-full">
      <div className="flex space-x-2">
        <Input
          type="text"
          value={userInput}
          onChange={(e) => setUserInput(e.target.value)}
          onKeyPress={handleKeyPress}
          placeholder="Type your message..."
          disabled={isLoading}
        />
        <Button
          variant="secondary"
          onClick={handleChatSubmit}
          disabled={isLoading}
        >
          <Icons.Send className="w-4 h-4" />
        </Button>
      </div>

      {suggestionsVisible && (
        <div className="space-y-2">
          <p className="text-sm text-gray-600 dark:text-gray-400">
            Suggested questions:
          </p>
          <div className="flex flex-col gap-2">
            {questionSuggestions.map((question, index) => (
              <button
                key={index}
                className="text-left px-3 py-2 text-sm bg-neutral-100 dark:bg-neutral-800 rounded hover:bg-neutral-200 dark:hover:bg-neutral-700"
                onClick={() => {
                  setUserInput(question);
                  setSuggestionsVisible(false); // Hide suggestions after selection
                }}
              >
                {question}
              </button>
            ))}
          </div>
        </div>
      )}

      {isLoading && !isStreaming && (
        <div className="flex justify-center items-center">
          <LoadingSpinner size={32} className="text-primary" />
        </div>
      )}

      {botResponse && (
        <Card>
          <CardContent>
            <div className="prose dark:prose-invert mt-6 space-y-6 w-full">
              <ReactMarkdown
                remarkPlugins={[remarkGfm]}
                components={components}
              >
                {botResponse}
              </ReactMarkdown>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
};
