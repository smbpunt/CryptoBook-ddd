<?php

namespace Cryptobook\Domain\Contract\Exception;

abstract class DomainException extends \Exception
{
    protected function __construct(string $message)
    {
        parent::__construct($message);
    }
}